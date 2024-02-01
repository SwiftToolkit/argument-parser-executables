FROM swift:5.9-amazonlinux2 as cheatsheet-executable-builder

WORKDIR /build

# First just resolve dependencies.
# This creates a cached layer that can be reused
# as long as your Package.swift/Package.resolved
# files do not change.
COPY ./Package.* ./

RUN swift package resolve --skip-update \
$([ -f ./Package.resolved ] && echo "--force-resolved-versions" || true)

# Copy entire repo into container
COPY . .

RUN swift build -c release

# RUN ls $(swift build --package-path . -c release --show-bin-path)
# RUN echo "$(swift build --package-path . -c release --show-bin-path)"
# RUN ls $(swift build --package-path . -c release --show-bin-path)

RUN cp "$(swift build --package-path . -c release --show-bin-path)/sync-command" ./bin/sync-command
RUN cp "$(swift build --package-path . -c release --show-bin-path)/arguments-1" ./bin/arguments-1
RUN cp "$(swift build --package-path . -c release --show-bin-path)/arguments-2" ./bin/arguments-2
RUN cp "$(swift build --package-path . -c release --show-bin-path)/subcommands" ./bin/subcommands

# WORKDIR /libswift
# RUN cp -a /usr/lib/swift/linux/. ./

FROM scratch AS binaries
COPY --from=cheatsheet-executable-builder /build/bin ./
# COPY --from=cheatsheet-executable-builder /libswift ./libswift

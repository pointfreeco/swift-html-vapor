SUDO = sudo --prompt=$(SUDO_PROMPT)
SUDO_PROMPT = "  🔒 Please enter your password: "
SDK_PATH = $(shell xcrun --show-sdk-path 2>/dev/null)
FRAMEWORKS_PATH = $(SDK_PATH)/System/Library/Frameworks

bootstrap: xcodeproj install-mm-xcodeproj

xcodeproj:
	swift package generate-xcodeproj
	xed .

test-linux:
	docker build --tag html . \
		&& docker run --rm html

test-macos: xcodeproj
	brew install libressl
	set -o pipefail && \
	xcodebuild test \
		-scheme HtmlVaporSupport-Package \
		-destination platform="macOS" \
		| xcpretty

linux-main:
	swift test --generate-linuxmain

test-swift: linux-main
	swift test

test-all: test-linux test-mac

install-mm-xcodeproj: xcodeproj
	@ls HtmlVaporSupport.xcodeproj/GeneratedModuleMap | xargs -n1 -I '{}' $(SUDO) mkdir -p "$(FRAMEWORKS_PATH)/{}.framework"
	@ls HtmlVaporSupport.xcodeproj/GeneratedModuleMap | xargs -n1 -I '{}' $(SUDO) cp "./HtmlVaporSupport.xcodeproj/GeneratedModuleMap/{}/module.modulemap" "$(FRAMEWORKS_PATH)/{}.framework/module.map"

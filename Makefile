build-icon:
	@echo "=> Generating AppIcon"
	dart run flutter_launcher_icons

build-app: build-icon
	@echo "=> Building App"
	flutter install --release

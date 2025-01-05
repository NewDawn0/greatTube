buildIcon:
	@echo "Resizing icon"
	convert ./icon/Icon.png -resize 1024x1024 icon.png

buildSrc:
	@echo "Building source"
	xcodebuild

dist: buildSrc
	@echo "Building ipa"
	mkdir -p dist/
	zip -r greatTube.ipa ./build/Release-iphoneos/greatTube.app
	cp -r ./build/Release-iphoneos/greatTube.app dist
	mv ./greatTube.ipa ./dist

clean:
	@echo "Cleaning"
	rm -rf ./dist ./build

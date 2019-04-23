ROOT=`pwd`
PROJECT=CommandLineMenu
BUILDDIR=build
CONFIGURATION=Debug

rpm: clean tar rpmbuild

build: clean app

clean:
	rm -rf $(ROOT)/build
	rm -rf $(ROOT)/*/bin/
	rm -rf $(ROOT)/*/obj/
	#rm -rf packages

app: 
	nuget restore $(ROOT)/src/$(PROJECT).sln
	msbuild $(ROOT)/src/$(PROJECT).sln /t:$(PROJECT) /p:Configuration="$(CONFIGURATION)" /p:Platform="Any CPU" /p:BuildProjectReferences=false
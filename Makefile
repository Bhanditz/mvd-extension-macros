# Path to BIMserver jars

BIMSERVER_PATH = BIMserver/

BIMSERVER_JARS = $(BIMSERVER_PATH)org.eclipse.emf.common_2.9.1.v20130827-0309.jar:$(BIMSERVER_PATH)org.eclipse.emf_2.6.0.v20130902-0605.jar:$(BIMSERVER_PATH)org.eclipse.emf.ecore_2.9.1.v20130827-0309.jar:$(BIMSERVER_PATH)bimserver-1.4.0-FINAL-2015-11-04-shared.jar:$(BIMSERVER_PATH)bimserver-1.4.0-FINAL-2015-11-04.jar:$(BIMSERVER_PATH)commons-io-1.4.jar:$(BIMSERVER_PATH)guava-18.0.jar

QUERY_PLUGIN_PATH = ../BIMserver-query-plugin-shell/

MIRAH_PARSER_PATH = mirah/dist/

OTHER_JARS = "$(QUERY_PLUGIN_PATH)BIMserver-query-plugin-shell.jar:$(MIRAH_PARSER_PATH)mirahc.jar"

# Build directories

PACKAGE_DIR = net/flaviusb/bim/mvd/

TEMP_DIR = temp/

ARTIFACTS = built/

# Location to output mvd jar

OUTPUT_MVD_JAR = mvd-macros.jar

$(OUTPUT_MVD_JAR): $(MIRAH_TARGETS)
	mkdir -p "$(ARTIFACTS)"
	mirahc -classpath "$(BIMSERVER_JARS):$(OTHER_JARS)" -d "$(ARTIFACTS)" $(MIRAH_TARGETS)
	cp -R prebuilt/META-INF "$(ARTIFACTS)"
	cd "$(ARTIFACTS)" && jar cf mvd.jar * && cd -
	mv "$(ARTIFACTS)"mvd.jar "$(OUTPUT_MVD_JAR)"

MIRAH_TARGETS = "$(PACKAGE_DIR)mvd_extension_macros.mirah" \
                "$(PACKAGE_DIR)RegisterMacros.mirah"

all: $(OUTPUT_MVD_JAR)

clean:
	rm -rf $(ARTIFACTS) "$(TEMP_DIR)"

.DEFAULT_GOAL := all

.PHONY: clean

all: CycloRoute.osf

CONTENTS = BUILD/items.json BUILD/profile_bicycle.json BUILD/rendering/CycloRoute.render.xml

CycloRoute.osf: $(CONTENTS)
	rm -f "$@"
	cd BUILD && zip -r "$(abspath $@)" .

BUILD/items.json: build.osf/items.json
BUILD/profile_bicycle.json: build.osf/profile_bicycle.json
BUILD/rendering/CycloRoute.render.xml: CycloRoute.render.xml

$(CONTENTS):
	mkdir -p "$(dir $@)"
	cp "$<" "$@"

clean:
	rm -rf BUILD

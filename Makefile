.PHONY = install test

project = Adwaitha-Zenburn
install_dir = ~/.themes/$(project)/gtk-3.0
build_dir = build

scss_files = $(wildcard src/_*.scss)
scss_main = src/gtk-contained.scss

asset_extras = $(patsubst src/%,build/%,$(wildcard src/assets/*))

asset_dir = $(build_dir)/assets
asset_index != cat src/assets.txt
assets := $(addprefix build/assets/, $(addsuffix .png, $(asset_index)) $(addsuffix @2.png, $(asset_index)) )

# concatenate the string to each target
# targets := $(addprefix $(prefix),$(targets))

SASSC = sass -M -t compact
INKSCAPE = inkscape
OPTIPNG = optipng

all: $(build_dir)/gtk.css $(assets) $(asset_extras)

build/gtk.css: $(scss_main) $(scss_files)
	$(SASSC) $< $@

install: all
	rsync -r --mkpath build/ $(install_dir)

test: install
	GTK_THEME=$(project) gtk3-widget-factory

$(build_dir):
	mkdir -p $@

$(asset_dir)/%.svg: src/assets/%.svg
	cp -t $(asset_dir) $<

$(asset_dir)/%.png: src/assets/%.png
	cp -t $(asset_dir) $<

$(asset_dir)/%.png: src/assets.svg
	$(INKSCAPE) --export-id=$* --export-id-only --export-png=$@ $< 2> /dev/null

$(asset_dir)/%@2.png: src/assets.svg
	$(INKSCAPE) --export-id=$* --export-id-only --export-dpi=180 --export-png=$@ $< 2> /dev/null

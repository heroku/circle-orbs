srcdirs := $(wildcard src/**/**/*) 
.build/%.yml: $(srcdirs)
	circleci config pack ./src/$* > .build/$(notdir $@)

.PHONY: pack Makefile
pack: .build/$(ORB).yml

.PHONY: validate
validate: check-orb pack
	circleci orb validate .build/$(ORB).yml

.PHONY: publish
publish: check-version check-orb validate
	circleci orb publish .build/$(ORB).yml heroku/$(ORB)@$(VERSION)
ifneq (dev:,$(findstring dev:,$(VERSION)))
	git tag $(ORB)-v$(VERSION)
	git push --tags
endif

.PHONY: new
new: check-orb
	circleci orb create heroku/$(ORB)
	mkdir -p src/$(ORB)
	echo "version: 2.1" > src/$(ORB)/@$(ORB).yml
	echo "description: New orb $(ORB)." >> src/$(ORB)/@$(ORB).yml
	$(MAKE) validate ORB=$(ORB)

.PHONY: check-versionq
check-version:
ifndef VERSION
	$(error VERSION is undefined; Run: `make VERSION="..." publish`)
endif

.PHONY: check-orb
check-orb:
ifndef ORB
	$(error ORB is undefined; Run: `make ORB="..." publish`)
endif

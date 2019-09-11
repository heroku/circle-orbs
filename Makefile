golang.yml: $(wildcard src/golang/**/*)
	circleci config pack ./src/golang > golang.yml

.PHONY: pack
pack: golang.yml

.PHONY: validate
validate: golang.yml
	circleci orb validate golang.yml

.PHONY: publish
publish: check-version validate
	circleci orb publish ./golang.yml heroku/golang@$(VERSION)

.PHONY: check-version
check-version:
ifndef VERSION
	$(error VERSION is undefined; Run: `make VERSION="..." publish`)
endif
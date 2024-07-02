
flux-install:
	@kubectl apply -f flux/tuned-install/install.yaml
	@kubectl apply -f flux/tuned-install/git-source.yaml
	@kubectl apply -f flux/tuned-install/app.yaml

flux-init-wait:
	@echo 'Waiting for flux to initialize...'
	@kubectl wait --for=condition=available --timeout=60s -n flux-system deploy/kustomize-controller \
	|| echo "ERROR: Flux Failed to Initialse. Please 'make down' and reboot."



k8s-start:
	sudo brew services start chipmk/tap/docker-mac-net-connect
	minikube start
k8s-stop:
	sudo brew services stop chipmk/tap/docker-mac-net-connect
	minikube stop
tf-plan:
	terraform -chdir=infrastructure plan
tf-apply:
	terraform -chdir=infrastructure apply -auto-approve
help:     ## Show this help.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)
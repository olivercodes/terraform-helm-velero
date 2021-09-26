package test

import (
	"fmt"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/k8s"
	"github.com/gruntwork-io/terratest/modules/terraform"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

type HelmOutput struct {
	chart_version string
	name          string
	namespace     string
	status        string
}

func TestVelero(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../example",
		VarFiles:     []string{"velero.tfvars"},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	appName := "velero"
	options := k8s.NewKubectlOptions("", "~/.kube/config", "velero")

	k8s.AreAllNodesReady(t, options)

	filters := metav1.ListOptions{
		LabelSelector: fmt.Sprintf("name=%s", appName),
	}

	pods := k8s.ListPods(t, options, filters)
	for _, pod := range pods {
		fmt.Printf("%s", pod.Name)
		k8s.WaitUntilPodAvailable(t, options, pod.Name, 60, 5*time.Second)
	}
}

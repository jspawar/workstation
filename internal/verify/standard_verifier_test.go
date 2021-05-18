package verify_test

import (
	"bytes"
	"testing"

	"github.com/jspawar/workstation/internal/verify"
	. "github.com/onsi/gomega"
)

func TestVerifyStdStreams(t *testing.T) {
	// TODO: switch to ginkgo or use `NewWithT`
	RegisterTestingT(t)

	verifier := verify.NewStdStreamsVerifier()

	rawScript := []byte(`#!/bin/bash
echo "this is a verification script...everything looks fine here!"
exit 0`)
	rawScriptBuffer := bytes.NewReader(rawScript)

	proc, err := verifier.Verify(rawScriptBuffer)
	Expect(err).To(BeNil())

	Expect(proc.Exited()).To(BeTrue())
	Expect(proc.ExitCode()).To(Equal(0))
}

func TestVerifyStdStreamsNonzeroExit(t *testing.T) {
	// TODO: switch to ginkgo or use `NewWithT`
	RegisterTestingT(t)

	verifier := verify.NewStdStreamsVerifier()

	rawScript := []byte(`#!/bin/bash
echo "this is a verification script...uh oh...we got some problems"
exit 23`)
	rawScriptBuffer := bytes.NewReader(rawScript)

	proc, err := verifier.Verify(rawScriptBuffer)
	Expect(err).To(BeNil())

	Expect(proc.Exited()).To(BeTrue())
	Expect(proc.ExitCode()).To(Equal(23))
}

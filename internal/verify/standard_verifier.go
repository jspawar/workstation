package verify

import (
	"io"
	"io/ioutil"
	"os"
	"os/exec"
)

type StdStreamsVerifier struct {
}

func NewStdStreamsVerifier() Verifier {
	return StdStreamsVerifier{}
}

func (v StdStreamsVerifier) Verify(rawReader io.Reader) (*os.ProcessState, error) {
	rawScript, err := ioutil.ReadAll(rawReader)
	if err != nil {
		// TODO: test
		panic(err)
	}
	// TODO: surely there is something wrong with shelling out to some random bytes...?
	// TODO: add any other guardrails for this subprocess?
	cmd := exec.Command("bash", "-c", string(rawScript))
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	err = cmd.Run()
	if err != nil {
		// TODO: return error or process state on nonzero exit code?
		// return process state if process return with nonzero exit code
		if cmd.ProcessState != nil && cmd.ProcessState.Exited() && cmd.ProcessState.ExitCode() != 0 {
			return cmd.ProcessState, nil
		}
		panic(err)
	}
	return cmd.ProcessState, nil
}

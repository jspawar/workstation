package verify

import (
	"io"
	"os"
)

type Verifier interface {
	Verify(rawScript io.Reader) (*os.ProcessState, error)
}

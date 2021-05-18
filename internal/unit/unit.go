package unit

type Unit struct {
	Name string
	Path string
	Dependencies []Unit
}

func OpenUnitDir(dir string) Unit {
	// TODO: open directory, determine dependencies (avoiding cycles), etc.
	return Unit{}
}

// TODO: what to return?
func (u Unit) VerifyDependencies() error {
	panic("todo")
}

// TODO: what to return?
func (u Unit) InstallDependencies() error {
	panic("todo")
}

// TODO: what to return?
func (u Unit) VerifyUnit() error {
	panic("todo")
}

// TODO: what to return?
func (u Unit) InstallUnit() error {
	panic("todo")
}

// TODO: what to return?
func (u Unit) UninstallUnit() error {
	panic("todo")
}

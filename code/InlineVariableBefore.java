public class InlineVariable extends Refactoring {
  private AssignStmt definition;

  // constructors, correctness checks, ...

  public void apply() {
    UseDefDefUseChain udduChain = definition.getMatlabProgram().analyze().getUseDefDefUseChain();
    for (Name name : udduChain.getUses(definition)) {
      name.getParent().setChild((Name) name.fullCopy(),
          node.getParent().getIndexOfChild(name));
    }
    definition.getParent().removeChild(
        definition.getParent().getIndexOfChild(definition);
  }
}

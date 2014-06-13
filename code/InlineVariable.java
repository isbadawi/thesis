public class InlineVariable extends Refactoring {
  private AssignStmt definition;

  // constructors, correctness checks, ...

  public void apply() {
    Transformer transformer = context.getTransformer(definition);
    UseDefDefUseChain udduChain = definition.getMatlabProgram().analyze().getUseDefDefUseChain();
    for (Name name : udduChain.getUses(definition)) {
      transformer.replace(name.getParent(), transformer.copy(definition.getRHS()));
    }
    transformer.remove(definition);
  }
}

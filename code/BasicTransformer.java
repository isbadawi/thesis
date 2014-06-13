public class BasicTransformer implements Transformer {
  private Program program;

  public BasicTransformer(Program program) {
    this.program = program;
  }

  public void replace(ASTNode<?> node, ASTNode<?> newNode) {
    node.getParent().setChild(newNode, node.getParent().getIndexOfChild(node));
  }

  public void remove(ASTNode<?> node) {
    node.getParent().removeChild(node.getParent().getIndexOfChild(node));
  }

  public void insert(ASTNode<?> node, ASTNode<?> newNode, int i) {
    node.insertChild(newNode, i);
  }

  public <T extends ASTNode<?>> T copy(T node) {
    return (T) node.fullCopy();
  }

  public String reconstructText() {
    return program.getPrettyPrinted();
  }
}

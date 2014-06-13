public interface Transformer {
  void replace(ASTNode<?> node, ASTNode<?> newNode);
  void remove(ASTNode<?> node);
  void insert(ASTNode<?> node, ASTNode<?> newNode, int i);
  <T extends ASTNode<?>> T copy(T node);
  String reconstructText();
}

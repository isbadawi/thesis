public class ExtractFunction extends Refactoring {
  private StatementRange extractionRange;
  private Function enclosingFunction;
  private String extractedFunctionName;

  // constructors, correctness checks, ...

  // Synthesizes a call to the extracted function. Since there is no
  // code to preserve, it doesn't use the transformation API.
  private Stmt makeCallToExtractedFunction() { /* ... */ }
  // Determines the extracted function's input parameters
  private List<String> inputVars() { /* ... */ }
  // Determines the extracted function's output parameters
  private List<String> outputVars() { /* ... */ }
  // Determines the global variables used by the extracted function
  private List<String> globalVars() { /* ... */ }

  public void apply() {
    Transformer transformer = context.getTransformer(enclosingFunction);
    Function extracted = new Function(extractedFunctionName);
    for (Stmt stmt : extractionRange) {
      transformer.insert(extracted.getStmts(), transformer.copy(stmt), extracted.getNumStmt());
    }

    extracted.addInputParams(inputVars());
    extracted.addOutputParams(outputVars());
    for (String var : globalVars()) {
      transformer.insert(extracted.getStmts(), new GlobalStmt(var), 0);
    }

    List<Function> functionList = ((FunctionList) enclosingFunction.getParent()).getFunctions();
    transformer.insert(functionList, extracted, functionList.getIndexOfChild(enclosingFunction) + 1);
    for (int i = 0; i < extractionRange.size(); ++i) {
      transformer.remove(extractionRange.getStartStatement());
    }
    transformer.insert(extractionRange.getEnclosingStatementList(),
      makeCallToExtractedFunction(), extractionRange.getStartIndex());
  }

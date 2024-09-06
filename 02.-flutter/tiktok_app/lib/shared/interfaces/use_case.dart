// Interface para métodos básicos
abstract class ExecuteUseCase<R> {
  R execute();
}

// Interface para métodos con valor
abstract class ExecuteByParamUseCase<R,P> {
  R executeByParam(P param);
}

// Interface para métodos con payload
abstract class AttachPayloadUseCase<R,P,D> {
  R attachPayload(P payload, D id);
}

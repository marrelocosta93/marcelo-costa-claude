---
description: "Self-check obrigatório antes de declarar qualquer trabalho como completo"
paths:
  - "**/*"
---

# Protocolo Quality Gate

## ANTES de declarar trabalho completo, SEMPRE:

### 1. Re-ler Objetivo Original
Abra o task_plan.md, SPEC.md, ou a mensagem original do usuário.
Releia o que foi pedido, literalmente.

### 2. Checklist Item por Item
Para CADA item do plano/spec:
- [ ] Implementado? (existe no código)
- [ ] Completo? (não é stub/placeholder)
- [ ] Conectado? (integrado com o resto)
- [ ] Testado? (tem teste ou foi verificado)

### 3. Contagem
- Total de itens: X | Completos: Y | Parciais: Z | Faltando: W
- Se W > 0 ou Z > 0 → NÃO declare completo. Continue implementando.

### 4. Busca por Stubs
Procure: `TODO`, `FIXME`, `HACK`, `XXX`, `NotImplementedError`, `pass` em funções com corpo esperado, `// ...` como placeholder, prints de debug.
Se encontrar → NÃO declare completo. Implemente.

### 5. Verificação de Conexões
Rota criada mas não registrada? Componente criado mas não importado? Tipo definido mas não usado? Teste criado mas não no suite?

### 6. Só Então
Após TODOS passarem → declare completo com evidência:
"Completei X/X itens. Stubs: limpo. Conexões: verificadas."

---
description: "Auditoria de segurança: OWASP Top 10, secrets em código, dependências vulneráveis, permissões excessivas, auth/authz."
---

# Skill: Security Audit

## Checklist
1. **OWASP Top 10**: Injection, Broken Auth, Sensitive Data Exposure, XXE, Broken Access Control, Misconfig, XSS, Insecure Deserialization, Vulnerable Components, Insufficient Logging
2. **Secrets**: `grep -rn "password\|secret\|api_key\|token\|private_key"` + verificar .env no .gitignore
3. **Deps**: `npm audit` / `pip audit`
4. **Permissões**: CORS restrito? Menor privilégio? Paths sanitizados? Rate limiting?
5. **Auth**: Bypass possível? Token refresh? Password hashing? Session flags?

## Output: `docs/ai-state/security-report.md` com severidade e remediação

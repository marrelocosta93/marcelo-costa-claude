---
description: "Testes E2E com Playwright como usuário real. APIs reais, não mocks. Fluxos completos no browser com edge cases de UX."
---

# Skill: E2E Testing (Playwright)

## ★ APIS REAIS, NÃO MOCKS
Mocks escondem os bugs que E2E deve encontrar.
Exceções: serviços pagos (usar sandbox) ou indisponíveis (documentar).

## Pré-requisitos
- Playwright instalado | App rodando com APIs reais | DB de teste populado

## Seletores: Accessibility-First
1. `getByRole` → 2. `getByLabel` → 3. `getByText` → 4. `getByTestId` → ~~CSS~~ NUNCA

## Testar Como Humano Real
- Double-click submit (duplicata?) | Back durante loading (quebra?)
- Acentos/emojis/chars especiais (preserva?) | Teclado (acessível?)
- Mobile 375x667 (funciona?) | Campo vazio + submit (valida?)
- XSS em text fields (escapa?) | Sessão expirada (redireciona?)

## Capturar TUDO: console errors, page errors, HTTP 4xx/5xx

## Output: `docs/ai-state/e2e-report.md`

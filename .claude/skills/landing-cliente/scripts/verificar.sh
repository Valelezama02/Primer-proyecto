#!/usr/bin/env bash
# Verifica una landing generada por la skill landing-cliente.
# Uso: bash .claude/skills/landing-cliente/scripts/verificar.sh clientes/<slug>
set -u

dir="${1:-}"
if [ -z "$dir" ] || [ ! -d "$dir" ]; then
  echo "Uso: $0 clientes/<slug>" >&2
  exit 2
fi

html="$dir/index.html"
css="$dir/styles.css"
errores=0
ok()   { echo "  ✔ $1"; }
fail() { echo "  ✘ $1"; errores=$((errores + 1)); }

echo "Verificando $dir"

for f in "$html" "$css" "$dir/README.md"; do
  [ -f "$f" ] && ok "existe $(basename "$f")" || fail "falta $(basename "$f")"
done
[ -f "$html" ] && [ -f "$css" ] || { echo "Errores: $errores"; exit 1; }

grep -q '<html lang="es"' "$html"            && ok 'lang="es"'          || fail 'falta <html lang="es">'
grep -q '<title>' "$html"                     && ok '<title>'            || fail 'falta <title>'
grep -q 'name="description"' "$html"          && ok 'meta description'   || fail 'falta meta description'
grep -q 'name="viewport"' "$html"             && ok 'meta viewport'      || fail 'falta meta viewport'
grep -q 'styles.css' "$html"                  && ok 'enlaza styles.css'  || fail 'no enlaza styles.css'

for v in --orange-500 --orange-600 --orange-700 --primary; do
  grep -q -- "$v:" "$css" && ok "variable $v" || fail "falta la variable $v (paleta naranja)"
done

usos=$(grep -o 'var(--\(orange-[0-9]*\|primary\|primary-hover\|accent\|bg-soft\))' "$css" | wc -l)
[ "$usos" -ge 8 ] && ok "naranja usado $usos veces" || fail "naranja usado solo $usos veces (mínimo 8, debe predominar)"

for s in '<header' '<main' '<footer' 'hero'; do
  grep -q "$s" "$html" && ok "sección $s" || fail "falta $s"
done

if grep -qi 'lorem ipsum' "$html" || grep -qw 'TODO\|XXX' "$html" || grep -q '{{' "$html"; then
  fail 'quedan textos de relleno (lorem ipsum, TODO o {{...}})'
else
  ok 'sin textos de relleno'
fi

grep -q '@media' "$css"         && ok 'reglas responsive'  || fail 'sin @media (no es responsive)'
grep -q 'focus-visible' "$css"  && ok ':focus-visible'     || fail 'falta estilo :focus-visible'

echo
if [ "$errores" -eq 0 ]; then
  echo "Todo correcto."
else
  echo "Errores: $errores"
  exit 1
fi

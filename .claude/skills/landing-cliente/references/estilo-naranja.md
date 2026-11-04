# Estilo base: naranja predominante

El naranja es **siempre** el color principal de la marca en todas las landings.
Lo que cambia entre clientes es la tipografía, el tono de los textos y los acentos
secundarios, nunca el protagonismo del naranja.

## Paleta obligatoria

Copia estas variables tal cual al inicio de `styles.css`:

```css
:root {
  /* Naranja: color principal */
  --orange-50:  #FFF7ED;  /* fondos suaves de sección */
  --orange-100: #FFEDD5;  /* tarjetas, badges */
  --orange-200: #FED7AA;  /* bordes y degradados */
  --orange-500: #F97316;  /* decorativo: iconos, subrayados, degradados */
  --orange-600: #EA580C;  /* fondos de bloques grandes con texto grande */
  --orange-700: #C2410C;  /* botones con texto blanco, enlaces, texto naranja */
  --orange-800: #9A3412;  /* hover de botones */

  /* Neutros */
  --text:   #1C1917;
  --muted:  #57534E;
  --bg:     #FFFFFF;
  --border: #E7E5E4;

  /* Alias semánticos */
  --primary:       var(--orange-700);
  --primary-hover: var(--orange-800);
  --accent:        var(--orange-500);
  --bg-soft:       var(--orange-50);

  --radius: 16px;
}
```

## Cómo lograr que el naranja predomine

El naranja tiene que verse en estos lugares como mínimo:

- Botón principal (CTA) en todas las apariciones: fondo `--primary`, texto blanco.
- El bloque CTA final, con fondo naranja (`--orange-600` o un degradado
  `--orange-500` → `--orange-700`).
- Fondo del hero o de al menos una sección grande en `--orange-50`, o un degradado
  cálido que la cubra.
- Eyebrows, iconos, subrayados y detalles en `--accent`.
- Marcadores de imagen con degradados naranjas o cálidos (`--orange-100` → `--orange-200`).

No metas un segundo color de marca que compita con el naranja. Si el rubro pide un
acento extra (por ejemplo, verde para salud), úsalo en menos del 10 % de la superficie.

## Combinaciones de contraste permitidas

| Texto | Fondo | Uso |
|---|---|---|
| `--text` / `--muted` | `--bg`, `--orange-50`, `--orange-100` | Texto normal |
| Blanco | `--orange-700`, `--orange-800` | Botones, texto de cualquier tamaño |
| Blanco | `--orange-600` | Solo texto grande (≥ 24 px, o ≥ 19 px en negrita) |
| `--orange-700` | `--bg`, `--orange-50` | Enlaces y texto naranja |

Prohibido: texto blanco sobre `--orange-500` o `--orange-200`, y texto `--orange-500`
sobre blanco (no llega a 4.5:1).

## Tipografía según el tono

Cárgala de Google Fonts. Elige un par según el tono (ver `tonos.md`):

| Tono | Títulos | Texto |
|---|---|---|
| Lujoso / elegante | Cormorant Garamond o Playfair Display | Inter |
| Profesional / corporativo | Inter (600–700) | Inter |
| Cercano / cálido | Fraunces | Nunito Sans |
| Divertido / juvenil | Poppins (700) | Poppins |
| Técnico / experto | Space Grotesk | Inter |
| Natural / artesanal | Lora | Source Sans 3 |

Si el tono no está en la tabla, elige el par más cercano y explica por qué en el README.

## Componentes base

```css
.btn {
  display: inline-block;
  padding: 14px 28px;
  border-radius: 999px;
  background: var(--primary);
  color: #fff;
  font-weight: 600;
  text-decoration: none;
  transition: background .2s ease, transform .2s ease;
}
.btn:hover { background: var(--primary-hover); transform: translateY(-1px); }
.btn--ghost { background: transparent; color: var(--primary); border: 1.5px solid var(--primary); }
.btn--ghost:hover { background: var(--orange-50); }

:focus-visible { outline: 3px solid var(--accent); outline-offset: 3px; }

.eyebrow {
  color: var(--primary);
  text-transform: uppercase;
  letter-spacing: .14em;
  font-size: 13px;
  font-weight: 600;
}
```

## Layout

- `.container { max-width: 1160px; margin: 0 auto; padding: 0 24px; }` (16 px en móvil).
- Grillas de 3 o 4 columnas que pasan a 2 columnas por debajo de 860 px y a 1 por
  debajo de 600 px.
- Espaciado vertical entre secciones: 100–120 px en escritorio y 72–80 px en móvil.

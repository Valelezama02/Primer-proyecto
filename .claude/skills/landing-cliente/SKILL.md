---
name: landing-cliente
description: Crea la landing page de un cliente nuevo (HTML + CSS estático, naranja como color predominante). Úsala siempre que el usuario pida una landing, página de aterrizaje, web o sitio para un cliente nuevo, una marca o un negocio, aunque no diga "skill" ni "landing". Antes de crear nada exige cuatro datos: nombre de la página, nicho, rubro y tono. Si falta alguno, los pide y no escribe ningún archivo hasta tenerlos todos.
---

# Landing page para cliente nuevo

Esta skill se ejecuta cada vez que llega un cliente nuevo. Genera una landing page
estática (sin dependencias ni build) en `clientes/<slug>/`, con el **naranja como
color predominante**, adaptada al nicho, el rubro y el tono del cliente.

## Paso 1: reunir los datos obligatorios (no te saltes este paso)

Necesitas estos **cuatro datos**. Sin los cuatro **no se crea la landing**: no escribas
ni un archivo, ni una carpeta, ni un borrador.

| Dato | Qué es | Ejemplo |
|---|---|---|
| **Nombre de la página** | Nombre de la marca o del sitio, tal como debe aparecer | `upsleek` |
| **Rubro** | Sector o industria amplia del negocio | Belleza, gastronomía, salud, inmobiliaria, educación |
| **Nicho** | Segmento concreto dentro del rubro: qué vende y a quién | Skincare y accesorios para mujeres de 18 a 35 años |
| **Tono** | Cómo le habla la marca a su público | Cercano, profesional, lujoso, divertido, técnico, juvenil |

Cómo reunirlos:

1. Busca los datos en el mensaje del usuario y en lo ya dicho en la conversación.
   Usa solo lo que el usuario dijo explícitamente. No deduzcas el nicho a partir del
   nombre ni elijas un tono "por defecto".
2. Si falta **uno o más**, pregúntalos todos juntos en un solo mensaje (con la
   herramienta `AskUserQuestion` si está disponible, si no en texto) y **detente** a
   esperar la respuesta. Para el tono puedes ofrecer opciones de
   `references/tonos.md`, pero el usuario debe elegir.
3. Si una respuesta es vaga ("lo que sea", "tú decide", "algo bonito"), vuelve a
   preguntar por ese dato concreto. Solo se acepta una respuesta real.
4. Cuando tengas los cuatro, resúmelos en una línea ("Nombre: …, rubro: …, nicho: …,
   tono: …") y continúa.

Si el usuario insiste en que la crees sin algún dato, explícale que la skill no puede
generar la landing sin los cuatro datos y vuelve a pedir el que falta.

## Paso 2: preparar la carpeta

- Slug: el nombre en minúsculas, sin acentos, con espacios convertidos en guiones
  (`Café Luna` → `cafe-luna`).
- Carpeta de salida: `clientes/<slug>/`, con `index.html`, `styles.css` y `README.md`.
- Si la carpeta ya existe, **no la sobrescribas**: pregunta si hay que actualizarla o
  crear otra con un nombre distinto.

## Paso 3: construir la landing

Lee **`references/estilo-naranja.md`** (paleta obligatoria, tipografía y componentes)
y **`references/tonos.md`** (cómo escribir según el tono) antes de escribir el código.

### Estructura de secciones

Incluye siempre estas secciones, en este orden, con contenido adaptado al nicho y al
rubro. Nada de lorem ipsum.

1. **Barra de anuncio** (opcional según el rubro): oferta, envío o dato clave.
2. **Navegación**: logo de texto con el nombre, 3 o 4 enlaces ancla y un botón CTA.
3. **Hero**: eyebrow con el nicho, titular fuerte en el tono elegido, subtítulo de
   1 o 2 líneas y dos botones (principal naranja y secundario).
4. **Propuesta de valor / servicios / categorías**: 3 o 4 tarjetas con lo que ofrece
   el negocio. Usa la palabra que corresponda al rubro: "productos" para una tienda,
   "servicios" para una agencia, "menú" para un restaurante, etc.
5. **Beneficios**: 3 razones para elegir la marca, con icono o símbolo simple.
6. **Prueba social**: 2 o 3 testimonios de ejemplo, marcados en un comentario HTML
   como `<!-- EJEMPLO: reemplazar por testimonios reales -->`.
7. **CTA final**: bloque con fondo naranja y acción principal (formulario de
   contacto, newsletter, WhatsApp, reserva…, lo que tenga sentido para el rubro).
8. **Footer**: nombre, enlaces, redes y © con el año actual.

### Reglas técnicas

- HTML semántico (`header`, `main`, `section`, `footer`) con `lang="es"`, `<title>`
  y `<meta name="description">` escritos para el nicho.
- Solo HTML y CSS. JavaScript mínimo y en línea, solo si hace falta (por ejemplo,
  para el mensaje de gracias del formulario).
- Todos los colores en variables CSS en `:root`, tomadas de la paleta naranja.
- Diseño responsive: debe verse bien a 375 px de ancho, sin scroll horizontal.
- Contraste accesible: texto normal ≥ 4.5:1. Sigue las combinaciones permitidas de
  `references/estilo-naranja.md` (por ejemplo, nunca texto blanco pequeño sobre
  `--orange-500`).
- Imágenes: usa degradados naranjas o cálidos como marcador, con un comentario
  `/* Reemplazar por foto: background: url('img/...') center/cover; */`.
- `:focus-visible` visible en enlaces, botones e inputs.

### README del cliente

En `clientes/<slug>/README.md` anota el nombre, rubro, nicho y tono, cómo abrir la
página y qué falta reemplazar (fotos, testimonios, enlaces reales, datos de contacto).

## Paso 4: verificar

1. Ejecuta `bash .claude/skills/landing-cliente/scripts/verificar.sh clientes/<slug>`
   y corrige todo lo que marque como error.
2. Si tienes Playwright disponible, haz una captura a 1280 px y a 375 px de ancho y
   revísala: el naranja debe ser el color dominante, no debe haber texto cortado ni
   scroll horizontal.
3. Comprueba que los textos suenan en el tono pedido y hablan del nicho real.

## Paso 5: entregar

Resume en pocas líneas: dónde quedó la landing, los cuatro datos usados, qué secciones
tiene y qué contenido de ejemplo hay que reemplazar. Haz commit y push solo si el
usuario lo pide o si la sesión trabaja en una rama de desarrollo indicada para eso.

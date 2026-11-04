# moon

Landing page de **moon**, generada con la skill `landing-cliente`.

| Dato | Valor |
|---|---|
| Nombre | moon |
| Rubro | Peluquería de perros |
| Nicho | Peluquería especializada en perros de razas pequeñas y miniatura |
| Tono | Cercano / cálido (tutea, frases cortas y cariñosas) |
| Tipografía | Fraunces (títulos) + Nunito Sans (texto) |
| Color principal | Naranja (paleta en `:root` de `styles.css`) |

## Cómo verla

Abre `index.html` en el navegador. No necesita instalación.

## Secciones

Anuncio · Navegación · Hero · Servicios · Por qué moon · Opiniones · Reserva (CTA) · Footer

## Pendiente de reemplazar

- **Fotos:** el círculo naranja del hero (`.hero__moon`) y las tarjetas de servicios
  (`.service__img--1` … `--4`) son degradados de marcador. En `styles.css` hay que cambiarlos por
  `background: url('img/foto.jpg') center/cover;`.
- **Opiniones:** los tres testimonios son de ejemplo (`<!-- EJEMPLO -->` en `index.html`).
- **WhatsApp:** el enlace `https://wa.me/` no tiene número todavía.
- **Horarios:** la barra de anuncio dice "lunes a sábado"; hay que confirmarlo.
- **Redes:** los enlaces de Instagram y TikTok del footer apuntan a `#`.
- **Formulario:** de momento solo muestra un mensaje de gracias y no envía los datos a ningún sitio.
  Hay que conectarlo a WhatsApp, a un correo o a un servicio como Formspree.
- **Servicios:** confirmar que los cuatro servicios (baño, corte a tijera, spa de patitas y primera visita de
  cachorro) son los que ofrece moon, y añadir precios si se quieren mostrar.

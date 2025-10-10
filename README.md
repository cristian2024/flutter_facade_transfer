

<h1 align="center">
  <br>
  <a href="http://www.amitmerchant.com/electron-markdownify"><img src="https://f.hubspotusercontent20.net/hubfs/2829524/Copia%20de%20LOGOTIPO_original-2.png"></a>
  <br>
  Pragma
  <br>
</h1>

<h4 align="center">Patrón de diseño Facade, implementación y ejemplo en Flutter</h4>

<p align="center">
  <a href="https://docs.flutter.dev/">
    <img src="https://img.shields.io/badge/Flutter-v3.35.6-0488D7?style=flat&logo=Flutter" alt="Flutter" />
  </a>
  <a href="https://dart.dev/"><img src="https://img.shields.io/badge/Dart-v3.9.2-1C2834?style=flat&logo=dart" alt="Dart" /></a>
</p>
Este proyecto hace parte del artefacto asociado a los deseables en el uso del patrón de diseño Facade, según el caso de uso. Debemos tener en cuenta un buen análisis para la implementación de este tipo de soluciones y evitar caer en la sobreingeniería. Para ejemplificar la implementación de este patrón, hemos optado por un escenario relacionado con un proceso de transferencias bancarias. En este caso, el usuario debera seleccionar una cuenta origen, una destino, y agregar un valor.
<p></p>


A continuación se comparte el diagrama de clases del proyecto, enfocado en la implementación del patrón de diseño.
<p style="text-align: center;">
  <img src="readme_assets/flutter_class_diagram_observer.png" alt="Diagrama de clases del patrón Observer" width="600" height="auto" />
</p>



<p align="center">
  <a href="#topicos">Topicos</a> •
  <a href="#instalación-y-ejecución">Instalación y ejecución</a> •
  <a href="#consideraciones">Consideraciones</a> •
  <a href="#tecnologias">Tecnologías</a> •
  <a href="#credits">Autores</a> •
  <a href="#related">Relacionados</a>
</p>

## Topicos

* Flutter
* Dart
* Facade Pattern

## 🧭 Estructura del Proyecto

Este proyecto sigue una estructura feature-first, donde los archivos se organizan según la funcionalidad o característica a la que pertenecen.

```
├── lib 
├     ├── core               # codigo compartido entre las features
├     └── features           # carpeta con cada feature
├── readme_assets            # Recursos visuales para documentación
├── pubspec.yaml             # Archivo raíz con la configuración de las dependencias
└── README.md
```

## Instalación y ejecución

Para clonar y ejecutar está aplicación, necesitas [Git](https://git-scm.com) y [Flutter SDK](https://docs.flutter.dev/get-started/install) instalados en tu equipo. Una vez clonado el repositorio, es recomendable ejecutar el comando `Flutter pub get`, comando el cual obtendra las dependencias del proyecto, una vez obtenidas las dependencias necesarias del proyecto mendiante el anterior comando podremos ejecutar el proyecto.

## Consideraciones

Para tomar una decisión informada sobre el uso del patrón de diseño Facade, es esencial evaluar ciertos aspectos clave que garantizan un diseño eficiente, mantenible y escalable. A continuación, se presentan los principales puntos a considerar:

1. **Desacoplamiento de Abstracción e Implementación**
- Si necesitas separar una abstracción de su implementación para que ambas puedan evolucionar de manera independiente.

2. **Extensibilidad y Escalabilidad**
- Si prevés que la jerarquía de clases crecerá y quieres evitar la proliferación de subclases innecesarias.

3. **Compatibilidad con Principios SOLID**
- Se alinea con el Principio de Abierto/Cerrado (OCP), permitiendo agregar nuevas implementaciones sin modificar las abstracciones existentes.

- Favorece la Inversión de Dependencias (DIP) al depender de abstracciones en lugar de implementaciones concretas.

4. **Facilidad de Mantenimiento**
- Reduce la complejidad de código al evitar estructuras de herencia rígidas y facilita modificaciones sin afectar múltiples componentes.

5. **Impacto en el Rendimiento**
- Puede introducir una ligera sobrecarga debido a la delegación, por lo que su uso debe justificarse cuando el beneficio del desacoplamiento sea mayor.

> [!TIP]  
> Utiliza el patrón **Facade** cuando necesites que varios objetos se mantengan sincronizados con el estado de otro objeto sin acoplarlos directamente.

> [!TIP]  
> Aplica el patrón cuando quieras implementar un sistema de **eventos o notificaciones** en el que los suscriptores puedan añadirse o quitarse dinámicamente.

> [!TIP]  
> Utiliza Facade cuando quieras ocultar la implementación 



## Tecnologías
-   [Flutter](https://flutter.dev/)
-   [Dart](https://dart.dev/)


## Autores

| [<img src="https://avatars.githubusercontent.com/u/211274450?v=4?width=400" width=115><br><sub>Cristian Ramirez</sub>](https://github.com/juliocruizc) <br/> | 
:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|


## Relacionados

- Los patrones de diseño son soluciones habituales a problemas que ocurren con frecuencia en el diseño de software. Son como planos que se pueden personalizar para resolver un problema de diseño particular de tu código. Para mayor información recomendamos visitar el siguiente [enlace](https://refactoring.guru/es/design-patterns).
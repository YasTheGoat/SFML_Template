// To quickly build or release your sfml project
// create a tasks.json file in the .vscode folder and paste this:
//      "version": "2.0.0",
//      "tasks": [
//          {
//              "label": "debug",
//              "type": "shell",
//              "command": "build.bat d",
//              "problemMatcher": [],
//              "presentation": {
//                  "echo": false,
//                  "reveal": "always",
//                  "focus": false,
//                  "panel": "shared",
//                  "showReuseMessage": true,
//                  "clear": false,
//              }
//          },
//          {
//              "label": "release",
//              "type": "shell",
//              "command": "build.bat r",
//              "problemMatcher": [],
//              "presentation": {
//                  "echo": false,
//                  "reveal": "always",
//                  "focus": false,
//                  "panel": "shared",
//                  "showReuseMessage": true,
//                  "clear": false,
//              }
//          }
//      ]
//  }
// Now you simply have to press F5  and chose between build and release.

#include <SFML/Graphics.hpp>

int main()
{
    sf::RenderWindow window(sf::VideoMode(200, 200), "SFML works!");
    sf::CircleShape shape(100.f);
    shape.setFillColor(sf::Color::Green);

    while (window.isOpen())
    {
        sf::Event event;
        while (window.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                window.close();
        }

        window.clear();
        window.draw(shape);
        window.display();
    }

    return 0;
}
# SR Deathrun

![](https://i.imgur.com/A861gUK.jpeg)

The classical mod in which a single player fights alone against the other team, armed with nothing but a series of deadly traps. The opposing team must navigate the course and reach the end without dying — then finish off the activator to win the round. Built on top of [SR-Core](https://github.com/Iswenzz/SR-Core), the mod brings a full competitive and social experience to the classic deathrun format.

Not every round plays the same — at random, a round may launch in an alternate movement mode such as 190, CS, Q3, Q3CPM, Q3CPMW, Portal, keeping every game unpredictable and pushing players to adapt on the fly. Once per round, players can roll the dice for a random outcome that can work in their favour or against them. A shop lets you spend points — earned naturally just by playing — on lives, weapons, and health.

Players who die can spawn as a ghost and keep running the course, using the time to practise without affecting the live round. Per-map leaderboards and personal bests track your progress across every course, and demo playback lets you watch the current world record with slow motion and rewind to study any run in detail.

## Documentation
* [API](https://github.com/Iswenzz/SR-Dev/blob/master/docs/deathrun.md)

## Installation
Download the repository and extract it to your CoD4 ``/mods/sr_deathrun`` directory. Then navigate to ``scripts`` and run ``build_iwds.sh`` to build the IWDs, followed by ``build.sh`` to compile mod.ff.

## Requirements
Before running the mod, install ``SR-CoD4x`` with ``gsclib`` and set up a ``MariaDB`` database. Once all three are in place, launch the server with start.sh.

## Building
_Pre-Requisites:_
1. [CoD4 Mod Tools](https://github.com/promod/CoD4-Mod-Tools)

## Server
1. [SR-CoD4x](https://github.com/Iswenzz/SR-CoD4x)
2. [gsclib](https://github.com/Iswenzz/gsclib)

## Contributors:
***Note:*** If you would like to contribute to this repository, feel free to send a pull request, and I will review your code. Also feel free to post about any problems that may arise in the issues section of the repository.

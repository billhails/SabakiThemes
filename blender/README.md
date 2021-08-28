# SabakiThemes Blender Directory

This folder contains the resources used to make the themes, including the blend file.

## Notes on the Blend File
`SabakiThemes.blend` requires [Blender](https://www.blender.org/) 2.93.3. It *might* work with earlier versions
but I haven't tested. The renderer is set to "Cycles".

The project is heavily reliant on linking objects between scenes to avoid duplication of
resources. This saves some space but primarily allows editing of shared resources to benefit all of the users
of those resources. In particular there are only three stone meshes: a single-convex
Yunzi, a bi-convex Yunzi and a Japanese-style shape with a sharper rim. The various stone objects share those
meshes
(see [Duplicate Linked](https://docs.blender.org/manual/en/latest/scene_layout/object/editing/duplicate_linked.html))
but have their materials linked at the object level
(see [Data Block](https://docs.blender.org/manual/en/latest/render/materials/assignment.html#data-block))
so they can vary.
Likewise there is only one board mesh shared by the various board objects which provide the varying materials.
Finally there are only a handfull of cameras, a couple of different ones for the backgrounds, one for the board and one
for the stones, these are directly linked between scenes
(see [Link Object to Scene](https://docs.blender.org/manual/en/latest/scene_layout/object/editing/link_transfer/index.html)).

There are three scenes per theme: "ThemeName Background", "ThemeName Board" and "ThemeName Stones". Scenes comprising
a theme share a common HDRI environment in their
[World Properties](https://docs.blender.org/manual/en/latest/render/lights/world.html)
for consistent lighting. Each scene nominates its preferred camera in its
[Scene Properties](https://docs.blender.org/manual/en/latest/scene_layout/scene/properties.html).

The "Background" scenes are the most varied as some use a simple plane with a carpet texture, while others use a tatami mat
that I pulled in from an earlier project. They also link one of the cameras.

The "Board" scenes just contain a board and a link to a camera. The materials for each board are collected into a
[node group](https://docs.blender.org/manual/en/latest/render/shader_nodes/groups.html)
so they can be re-used by their sibling "Stones" scenes.

The "Stones" scenes contain the stones, a board and a linked camera.
The film setting for the stones theme is
[transparent](https://docs.blender.org/manual/en/latest/render/cycles/render_settings/film.html#transparent)
meaning the background behind the rendered stone image will be transparent.
The board material is interesting, it uses its sibling "Board" scene board node group but mixes it with a
[holdout](https://docs.blender.org/manual/en/latest/render/shader_nodes/shader/holdout.html)
shader with the mix factor determined by a
[light path](https://docs.blender.org/manual/en/latest/render/shader_nodes/input/light_path.html)
node's `Is Camera Ray` output.  The upshot of this is that the board
is invisible to the camera but still causes specular and diffuse
reflections on the stones.

### Gotchas
I thought I had found a bug, and even reported it to the blender developers, who kindly explained it was
actually behaving as expected though it is confusing, so I thought I'd share: In the properties editor,
in the Material Properties tab, the
[Material Slots](https://docs.blender.org/manual/en/latest/render/materials/assignment.html#material-slots)
are owned by the mesh, not the object.
Each slot then nominates wheter the actual material it contains belongs to the mesh or to the object.
This means that if you attempt to remove a material from an object by clicking the `-` button in the
material slots tab, you'll remove it from all objects that share that mesh. Instead you should remove or
replace it in the linked material field immediately below.

## make-seamless script

After rendering out a board or a background, you'll need to make it seamless (tileable). You can use
Photoshop or Gimp or possibly many other tools to do this, but if you have Gimp installed you might
be surprised to know that it is scriptable and can be run in
[batch mode](https://www.gimp.org/tutorials/Basic_Batch/).
I'm on a Mac but this should work fine on Linux, and shouldn't be too hard on Windows using this as an
example:

* Copy `simple-make-seamless.scm` to your gimp scripts directory.
   * For me that's `~/Library/Application\ Support/GIMP/2.10/scripts` (I had to create the `scripts` directory).
   * On Linux I beleve it's `~/.gimp-<version>/scripts`.
* Edit the `make-seamless` bash script and change the path to gimp if needed.
* You should then be able to run `./make-seamless path/to/your.png` to transform the file in place.

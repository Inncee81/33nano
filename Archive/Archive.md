# <span style='color:#74ffcb;'>Archive</span> 
> Completed projects and abandoned ideas that just might be reused reside here. 

<span style='background-color:#ff468b;'><span style='color:#000000;'>**Second Brain**</span> <span style='background-color:#00bfff;'><span style='color:#ffff00;'>**Prince Kaizen Namwali**</span> 



<span style='color:#00ffbf;'>





### <span style='color:#ffd1d8;'> Completed</span>



1. **Configs + Dotfiles** <!-- The total space consumption is under 1MB -->
- Amfora
- Aseprite
- Awesome WM
- Bash
- Calcurse
- Kitty
- Neofetch
- Neovim
- Polybar
- Ranger
- Rofi
- T-UI Launcher
2. **Custom Wallpaper** <!-- I used inkscape to trace my bitmap to my liking and added the final touch with effects using gimp. Its a process that requires both a raster graphics editor and scalable vector graphics editor to create a work of unison and excellence -->
3. **Figma**
- Neumprhic design
- 
4. **Firefox Backup**
- Leechblock NG list
- Custom hosts file for uBlock Origin <!-- Anno Denomini - hosted on my github -->
- Bookmarks <!-- Lots of emojis, Second Brain and made up names for folders -- >
- No script list
5. **Screen shots** 
- T-UI Launcher
- Tachiyomi library
- Pocket Casts Library
- Moon Reader Pro+ Library
- Markor Notes
- Mixplorer 2nd Brain directory
6. **Udemy Certificates**
- Go 
- Python 3
- Solidity
- Flutter + Dart
- GDScript
- Lua
- REBT
- Music Theory
- Figma
- UI & UX Design
7. **Manga** 
8. **Manhwa**
9. **Documentaries**
10. **Podcasts**
11. **Gelotology** <!-- (stand up comedy) -->





###  <span style='color:#ffd1d8;'> Random</span> 



1. Data consumption spreadsheet
2. Leet cheat sheet markdown
3. Pictures
- Pixelme
- SVG King
4. Files
5. Notes <!-- Audio, Videos

###  <span style='color:#ffd1d8;'> Applications </span>



1. **Onivim 2** <!-- Its only 60MB -->
2. **Bootstrap Studio** <!-- Why is this bigger than Onivim 2? I don't know! -->
3. **Itch** <!-- Game developer & player workspace -  no need to keep the executable, you can always redownload because its constantly updated -->
4. **Game Jolt** <!-- Game developer & player workspace - Same as the above comment -->
5. **Exif Cleaner** <!-- Privacy optimization - no metadata -->
6. **1 Bit Dragon** <!-- To some degree I feel like its one of the worst procedurally generated tools for music, I think Wolfram Tone generator, abundant music, fake music generator and AIVA do a better job. The only thing I seee myself using this app is for the drum programming -->
7. **LMMS** <!-- Linux Multimedia Studio (Open source digital audio workstation) - no need to keep the appimage you can always redownload with newer version. Hope fully the newer versions become better because it seems to the opposite. More clicks doesn't necessarily equate to higher productivity -->
8. **VCV Rack** <!-- Modular Synthesis for everyone - all the modules are streamlined through one website which sorta raises high levels of concern. Will the modules I purchased still he available in the near future when a massive databreach occurs? If the community added all the essential midi plugins natively would there be a need for third party modules? -->

###  <span style='color:#ffd1d8;'> Abandoned</span>

 
 1. **Essays** (Intellectual Waste)

<!--

What else was abandoned?

1. **Boot animations** (custom) - Its pretty useless considering that boot time is faster without animations.
2. **FL Studio Mobile projects** (.flm files) - Technically, you can't install Fl studio mobile on a gapps free android OS
3. **Love2D** (game projects) - mostly for studying how other people made games and making small tweaks. However, I am not a fun of a game framework if it means the work is 2X greater opposed to that of a game engine.
4. **Pixel Studio** (Its the equivalent of Aseprite on Android) - it has the same downfall, restoring purchase requires gapps, without it your eyes are raped by the evil light theme.
5. **RetroArch** (its the ultimate emulator, an app and also available as a stand alone OS) - I definitely will use it when the time comes
6. **PPSSPP Gold** (best PSP emulator) Does retroarch have a PSP emulator?
7. **Renpy** (visual novel game engine for Python) - It looks fascinating but I can't bring myself to learn it because its boring. I just think that in general visual novels aren't really gamifiable no matter what gamification elements are used. Visual novels will always be the poor mans PowerPoint. What's the real problem? Visual novels made with Renpy are just too big. 
8. **Systematic Mastery** (podcast) - it starts out great and slowly becomes more negative and disengaging like the little homunculus upstairs
9. **Pixelorama** ( Aseprite contender) - I just have it there, but my attraction for pixel art is rapidly fading away like a waning gibbous (moon phase). 
10. **Tabularasa** (blank canvases)
11. **Audio** (useless soundbites)
12. **Obsidian** (my config files, PARA, 80's neon CSS theme, Amethyst CSS theme, spectrum CSS theme
dzala - dzenje (pit), mchengautuwa, katoto, hilltop primary school,
andrew mary nursery school, takulandirani primary school - now became shalom.
golden gate primary school - RIP principal matinga,  Wadya ntolilo, 

**Golden open seafood inc**

-->

<span style='color:#ff5d46;'>

<details markdown='1'><summary>Q&A</summary>

!![](https://i.redd.it/1ctpb8dor8w61.png)



</details>

</span>





<!--
When you build a second Brain you create immense value for yourself, when you use your second Brain and share you create value for others..
-->



<!--
Keep your second Brain chaotic and your Hugo site serene. The initial problem was that I didn't have enough content, but now I am drowning in abundance. I have more content this time and its not just poems. What I need right now it to restructure my site to reflect my Second Brain.The only tags I will use are Projects, Areas, Resources and Archive. I need to take my time and not rush. Hosting is free and I won't have to renew my domain until 2 years from now. The dream theme might have been revamped, but I am already using the version that I like. The only difference that I could make, if any is changing the font type, I have vscodium for that. I will start with 2 high quality posts. December 31, 2020 and January 1, 2021. The first content will be archived for the time being. I started out the year great and I finally have the site, but I need to take the time to nurture my website. I also need to removed Google analytics because turns out, I didn't need that to begin with. My website already pops up as the first result on Google. render
-->

Animate with godot without using screen recorder to render

 ``` 
 extends Node2D 
 
var gifexporter = preload("res://gdgifexporter/gifexporter.gd") 
# load and initialize quantization method that you want to use 
 var median_cut = preload("res://gdgifexporter/quantization/median_cut.gd").new() 
 
var exporter 
var max_frames: int = 60
var current_frame: int = 1 

func _ready() -> void: 
	exporter = gifexporter.new(get_viewport().x, get_viewport().y) 	$AnimationPlayer.play("some_animation") func _physics_process(delta: float) -> void: 	
var img := get_viewport().get_texture().get_data() 	img.convert(Image.FORMAT_RGBA8) 

if current_frame < max_frames: 		exporter.write_frame(img, current_frame, median_cut) 		current_frame += 1 	

else: 		
var file: File = File.new() 		file.open("user://result.gif", File.WRITE) file.store_buffer(exporter.export_file_data()) 		
file.close()
``` 
 
 Godot rigging
  https://kairumagames.com/blog/rigging-2d-game-characters
  
Godot Animation
     https://kairumagames.com/blog/animating-2d-game-characters https://www.reddit.com/r/godot/comments/jqcmmd/gpu_particles_everywhere/

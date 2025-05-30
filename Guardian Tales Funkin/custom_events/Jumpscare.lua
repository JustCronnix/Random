
function returnDescription()
    return "JUMPSCARE AAAAA";

function returnDelay()
	return 0;

function eventFunction(params) {
    var length:Float = Std.parseFloat(params[1]);
    var portrait:String = 'Gold';
    switch (PlayState.dadOpponent.curCharacter.toLowerCase()) {
        case 'gold-headless':
            portrait = 'GoldAlt';
    }

    var newJumpscare:FlxSprite = new FlxSprite().loadGraphic(Paths.image('jumpscares/' + portrait));
    newJumpscare.setGraphicSize(Std.int(FlxG.width * PlayState.staticValues.get('jumpscareSize')));
    newJumpscare.cameras = [PlayState.dialogueHUD];
    newJumpscare.screenCenter();
    PlayState.instance.add(newJumpscare);
    trace(PlayState.staticValues.get('jumpscareSize'));
    PlayState.staticValues.set('jumpscareSize', (PlayState.staticValues.get('jumpscareSize') + 0.05));
    FlxTween.tween(newJumpscare, {alpha: 0
        // width: (newJumpscare.frameWidth * (PlayState.staticValues.get('jumpscareSize') + 0.5)), 
        // height: (newJumpscare.frameHeight * (PlayState.staticValues.get('jumpscareSize') + 0.125))
    }, ((Conductor.stepCrochet * (length * (1 / 2))) / 1000), {
        ease: FlxEase.expoIn, 
        onUpdate: function(tween:FlxTween) {
            var jumpscareSizeInterval:Float = PlayState.staticValues.get('jumpscareSize');
            var shakeIntensity:Float = (0.0125 * (jumpscareSizeInterval / 2));
            // newJumpscare.screenCenter();
            newJumpscare.x += FlxG.random.float(-shakeIntensity * FlxG.width, shakeIntensity * FlxG.width) * jumpscareSizeInterval * newJumpscare.scale.x;
            newJumpscare.y += FlxG.random.float(-shakeIntensity * FlxG.height, shakeIntensity * FlxG.height) * jumpscareSizeInterval * newJumpscare.scale.y;
        }
    });
}

function initFunction(params) {
    Paths.image('jumpscares/Gold');
    Paths.image('jumpscares/GoldAlt');
    if (PlayState.staticValues.get('jumpscareSize') != 1.2)
        PlayState.staticValues.set('jumpscareSize', 1.2); 
}

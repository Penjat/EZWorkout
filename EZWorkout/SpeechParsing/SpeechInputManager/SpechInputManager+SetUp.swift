

import Foundation

extension SpeechInputManager{
  
  
  func setUpExerciseRefs(){
    //-----------------exercise Refs --------------------------------
    exerciseRefs.append(ExerciseRef(name: "benchpress",muscleGroups: [MuscleGroup.Chest],exerciseType: ExerciseType.Weight))
    
    exerciseRefs.append(ExerciseRef(name: "twist",muscleGroups: [MuscleGroup.Core],exerciseType: ExerciseType.BodyWeight))
    
    exerciseRefs.append(ExerciseRef(name: "plank",muscleGroups: [MuscleGroup.Core],exerciseType: ExerciseType.Timed))
    
    exerciseRefs.append(ExerciseRef(name: "squat",muscleGroups: [MuscleGroup.Chest],exerciseType: ExerciseType.Weight))
    
    //TODO make sure this doesn't override others
    exerciseRefs.append(ExerciseRef(name: "curl",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight))
    
    exerciseRefs.append(ExerciseRef(name: "cleanandjerk",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"clean and jerk"))
    
    exerciseRefs.append(ExerciseRef(name: "stepup",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"step-ups"))
    
    exerciseRefs.append(ExerciseRef(name: "jumpingjacks",muscleGroups: [.Legs],exerciseType: ExerciseType.BodyWeight , outputName: "jumping-jacks"))
    
    exerciseRefs.append(ExerciseRef(name: "goodmorning",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"good mornings"))
    
    exerciseRefs.append(ExerciseRef(name: "situp",muscleGroups: [MuscleGroup.Core],exerciseType: ExerciseType.BodyWeight , outputName:"sit-ups"))
    
    exerciseRefs.append(ExerciseRef(name: "skullcrusher",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"skull crushers"))
    
    exerciseRefs.append(ExerciseRef(name: "arnoldpress",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"arnold press"))
    
    exerciseRefs.append(ExerciseRef(name: "dumbbellraise",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"dumbell raise"))
    
    exerciseRefs.append(ExerciseRef(name: "latpulldown",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"lat pulldown"))
    
    exerciseRefs.append(ExerciseRef(name: "shoulderraise",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"shoulder raise"))
    
    exerciseRefs.append(ExerciseRef(name: "legraise",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"leg raise"))
    
    //TODO chinup and pull ups are the same
    exerciseRefs.append(ExerciseRef(name: "pullup",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.BodyWeight , outputName:"pull-ups"))
    exerciseRefs.append(ExerciseRef(name: "chinup",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"chin-ups"))
    //---------------------------------
    
    //TODO put with dumbellpress
    exerciseRefs.append(ExerciseRef(name: "chestpress",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"chest press"))
    exerciseRefs.append(ExerciseRef(name: "boxjump",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"box jumps"))
    
    exerciseRefs.append(ExerciseRef(name: "floorpress",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"floor press"))
    
    exerciseRefs.append(ExerciseRef(name: "ironcross",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"iron cross"))
    
    exerciseRefs.append(ExerciseRef(name: "shrug",muscleGroups: [MuscleGroup.Traps],exerciseType: ExerciseType.Weight ))
    
    exerciseRefs.append(ExerciseRef(name: "dip",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight ))
    
    exerciseRefs.append(ExerciseRef(name: "jogging",muscleGroups: [MuscleGroup.Legs],exerciseType: ExerciseType.Distance ))
    
    exerciseRefs.append(ExerciseRef(name: "cycling",muscleGroups: [MuscleGroup.Legs],exerciseType: ExerciseType.Distance ))
    
    exerciseRefs.append(ExerciseRef(name: "skip",muscleGroups: [MuscleGroup.Legs],exerciseType: ExerciseType.Timed , outputName:"skipping"))
    
    exerciseRefs.append(ExerciseRef(name: "calfraise",muscleGroups: [MuscleGroup.Legs],exerciseType: ExerciseType.BodyWeight , outputName:"calf raise"))
    
    exerciseRefs.append(ExerciseRef(name: "cleanandpress",muscleGroups: [MuscleGroup.Legs],exerciseType: ExerciseType.BodyWeight , outputName:"clean and press"))
    
    //TODO roller and rollout are the same
    exerciseRefs.append(ExerciseRef(name: "abroller",muscleGroups: [MuscleGroup.Legs],exerciseType: ExerciseType.BodyWeight , outputName:"ab roller"))
    exerciseRefs.append(ExerciseRef(name: "rollout",muscleGroups: [MuscleGroup.Legs],exerciseType: ExerciseType.BodyWeight , outputName:"ab roller"))
    
    //TODO fix problem of plurals
    exerciseRefs.append(ExerciseRef(name: "tricepsextension",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"tricep extension"))
    exerciseRefs.append(ExerciseRef(name: "tricepextension",muscleGroups: [MuscleGroup.Biceps],exerciseType: ExerciseType.Weight , outputName:"tricep extension"))
    //------------------------
    
    
    exerciseRefs.append(ExerciseRef(name: "windmill",muscleGroups: [.Legs,.Back],exerciseType: ExerciseType.Weight))
    
    exerciseRefs.append(ExerciseRef(name: "deadlift",muscleGroups: [.Legs,.Back],exerciseType: ExerciseType.Weight))
    
    exerciseRefs.append(ExerciseRef(name: "lunge",muscleGroups: [.Legs,.Back],exerciseType: ExerciseType.Weight))
    
    //TODO take out later
    exerciseRefs.append(ExerciseRef(name: "push",muscleGroups: [MuscleGroup.Chest],exerciseType: ExerciseType.BodyWeight,outputName:"push-ups"))
    exerciseRefs.append(ExerciseRef(name: "pushup",muscleGroups: [MuscleGroup.Chest],exerciseType: ExerciseType.BodyWeight,outputName:"push-ups"))
    
    exerciseRefs.append(ExerciseRef(name: "dumbbellpress",muscleGroups: [MuscleGroup.Chest],exerciseType: ExerciseType.Weight))
    
    exerciseRefs.append(ExerciseRef(name: "legpress",muscleGroups: [MuscleGroup.Legs],exerciseType: ExerciseType.Weight))
    
    
    
    exerciseRefs.append(ExerciseRef(name: "shoulderpress",muscleGroups: [MuscleGroup.Shoulders],exerciseType: ExerciseType.Weight))
    
    exerciseRefs.append(ExerciseRef(name: "militarypress",muscleGroups: [MuscleGroup.Shoulders],exerciseType: ExerciseType.Weight))
    
    exerciseRefs.append(ExerciseRef(name: "crunch",muscleGroups: [MuscleGroup.Abs],exerciseType: ExerciseType.BodyWeight , outputName: "crunches"))
    
    exerciseRefs.append(ExerciseRef(name: "row",muscleGroups: [.Lats,.Back],exerciseType: ExerciseType.Weight , outputName: "row"))
    
    exerciseRefs.append(ExerciseRef(name: "fly",muscleGroups: [.Chest],exerciseType: ExerciseType.Weight , outputName: "fly"))
    
    exerciseRefs.append(ExerciseRef(name: "cabelcrossover",muscleGroups: [.Chest],exerciseType: ExerciseType.Weight , outputName: "cabel crossover"))
    
    exerciseRefs.append(ExerciseRef(name: "hangclean",muscleGroups: [.Chest],exerciseType: ExerciseType.Weight , outputName: "hang clean"))
    
    exerciseRefs.append(ExerciseRef(name: "pulldown",muscleGroups: [.Chest],exerciseType: ExerciseType.Weight , outputName: "pulldowns"))
    
    exerciseRefs.append(ExerciseRef(name: "legextension",muscleGroups: [.Chest],exerciseType: ExerciseType.Weight , outputName: "leg extension"))
    
    exerciseRefs.append(ExerciseRef(name: "bridge",muscleGroups: [.Chest],exerciseType: ExerciseType.Weight , outputName: "bridge"))
    
    exerciseRefs.append(ExerciseRef(name: "adductor",muscleGroups: [.Chest],exerciseType: ExerciseType.Weight , outputName: "adductor"))
    
    //-------------TODO tricep kickbacks as one
    exerciseRefs.append(ExerciseRef(name: "tricepdumbbellkickback",muscleGroups: [.Chest],exerciseType: ExerciseType.Weight , outputName: "tricep dumbell kickbacks"))
    
    exerciseRefs.append(ExerciseRef(name: "tricepkickback",muscleGroups: [.Chest],exerciseType: ExerciseType.Weight , outputName: "tricep kickbacks"))
    //------------------------
    exerciseRefs.append(ExerciseRef(name: "run",muscleGroups: [.Legs],exerciseType: ExerciseType.TimedDistance , outputName: "running"))
    
    exerciseRefs.append(ExerciseRef(name: "jog",muscleGroups: [.Legs],exerciseType: ExerciseType.TimedDistance , outputName: "jogging"))
    
  }
  
  func setUpModifiers(){
    //---------------------exercise modifiers-----------------------
    exerciseModifiers.append(ExerciseModifier(returnName: "incline", searchName: "incline", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "decline", searchName: "decline", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "hanging", searchName: "hanging", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "with chains", searchName: "chain", modifierType: .Postfix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "with dumbbells", searchName: "dumbbell", modifierType: .Postfix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "one-arm", searchName: "onearm", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "overhead", searchName: "overhead", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "seated", searchName: "seated", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "standing", searchName: "standing", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "sumo", searchName: "sumo", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "suspended", searchName: "suspended", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "weighted", searchName: "weighted", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "body-weight", searchName: "bodyweight", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "wide-grip", searchName: "widegrip", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "narrow-grip", searchName: "narrowgrip", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "with kettlebells", searchName: "kettlebell", modifierType: .Postfix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "with smith machine", searchName: "smithmachine", modifierType: .Postfix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "oblique", searchName: "oblique", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "reverse", searchName: "reverse", modifierType: .Prefix))
    
    exerciseModifiers.append(ExerciseModifier(returnName: "with medicine ball", searchName: "medicineball", modifierType: .Postfix))
  }
  func setUpCommands(){
    
    //TODO expand with more commands
    
    commands.append(CommandModel(keyWords: ["startwork","start","begin"] , speechCommand:.StartWorkout))
    
    commands.append(CommandModel(keyWords: ["endtwork","end","finish","andwork"] , speechCommand:.EndWorkout))
    
    commands.append(CommandModel(keyWords: ["undo"] , speechCommand:.Undo))
    

  }
  
}

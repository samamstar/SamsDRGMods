// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "PlayerCharacter.h"
#include "FSDPawn.h"
#include "CoreMinimal.h"
#include "Components/ActorComponent.h"
#include "FloatPerkComponent.generated.h"


UCLASS( ClassGroup=(Custom), meta=(BlueprintSpawnableComponent, IsBlueprintBase = "true") )
class FSD_API UFloatPerkComponent : public UActorComponent
{
	GENERATED_BODY()

public:	
	// Sets default values for this component's properties
	UFloatPerkComponent();

protected:
	// Called when the game starts
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction) override;
	UPROPERTY(BlueprintReadWrite) float FloatValue;

		
};

UCLASS( ClassGroup=(Custom), meta=(BlueprintSpawnableComponent))
class FSD_API UBeastMasterComponent : public UFloatPerkComponent
{
	GENERATED_BODY()

public:
	
	UFUNCTION(BlueprintCallable) UActorComponent* AddPetComponent(UActorComponent* ComponentClass, AFSDPawn* targetPet, APlayerCharacter* petOwner);
};
// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Pawn.h"
#include "FSDPawn.generated.h"

UCLASS()
class FSD_API AFSDPawn : public APawn
{
	GENERATED_BODY()

public:
	// Sets default values for this pawn's properties
	AFSDPawn();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:	
	

};

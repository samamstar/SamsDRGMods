// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "FSDGameState.h"

#include "CoreMinimal.h"
#include "Kismet/BlueprintFunctionLibrary.h"
#include "GameFunctionLibrary.generated.h"

/**
 * 
 */
UCLASS()
class FSD_API UGameFunctionLibrary : public UBlueprintFunctionLibrary
{
	GENERATED_BODY()

	UFUNCTION(BlueprintCallable, Category="FSD") AFSDGameState* GetFSDGameState(UObject* WorldContextObject);
};

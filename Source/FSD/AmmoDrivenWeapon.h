// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "ItemAggregator.h"

#include "CoreMinimal.h"
#include "AnimatedItem.h"
#include "AmmoDrivenWeapon.generated.h"

/**
 * 
 */

UENUM(BlueprintType)
enum class EAmmoWeaponState : uint8
{
	Equipping UMETA(DisplayName = "Equipping"),
	Ready UMETA(DisplayName = "Ready"),
	Cycling UMETA(DisplayName = "Cycling"),
	Reloading UMETA(DisplayName = "Reloading"),
	BurstCycling UMETA(DisplayName = "BurstCycling"),
};


UCLASS()
class FSD_API AAmmoDrivenWeapon : public AAnimatedItem
{
	GENERATED_BODY()
	
public:
	UPROPERTY(BlueprintReadOnly) float ReloadTimeLeft;
	UPROPERTY(BlueprintReadOnly) float CycleTimeLeft;
	UPROPERTY(BlueprintReadOnly) float ReloadDuration;
	UPROPERTY(BlueprintReadOnly) bool CanReload;
	UPROPERTY(BlueprintReadOnly) UAmmoDrivenWeaponAggregator* Aggregator;
	UPROPERTY(BlueprintReadOnly) EAmmoWeaponState WeaponState;
	
	
};

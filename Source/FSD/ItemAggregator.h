// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Components/ActorComponent.h"
#include "ItemAggregator.generated.h"


UCLASS( ClassGroup=(Custom), meta=(BlueprintSpawnableComponent) )
class FSD_API UItemAggregator : public UActorComponent
{
	GENERATED_BODY()

public:	
	// Sets default values for this component's properties
	UItemAggregator();

protected:
	// Called when the game starts
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction) override;

		
};

UCLASS(meta=(BlueprintSpawnableComponent))
class FSD_API UClipBasedItemAggregator : public UItemAggregator
{
	GENERATED_BODY()
public:
	DECLARE_DYNAMIC_MULTICAST_DELEGATE(FOnReloadComplete);
	UPROPERTY(BlueprintAssignable) FOnReloadComplete OnReloadComplete;

	DECLARE_DYNAMIC_MULTICAST_DELEGATE(FOnReloadStarted);
	UPROPERTY(BlueprintAssignable) FOnReloadStarted OnReloadStarted;


};

UCLASS(meta=(BlueprintSpawnableComponent))
class FSD_API UAmmoDrivenWeaponAggregator : public UClipBasedItemAggregator
{
	GENERATED_BODY()
public:
	
};
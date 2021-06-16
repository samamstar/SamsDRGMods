// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "Item.h"

#include "CoreMinimal.h"
#include "Components/ActorComponent.h"
#include "InventoryComponent.generated.h"


UCLASS( ClassGroup=(Custom), meta=(BlueprintSpawnableComponent) )
class FSD_API UInventoryComponent : public UActorComponent
{
	GENERATED_BODY()

public:	
	// Sets default values for this component's properties
	UInventoryComponent();

protected:
	// Called when the game starts
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction) override;

	DECLARE_DYNAMIC_MULTICAST_DELEGATE(FOnItemEquipped);
	UPROPERTY(BlueprintAssignable) FOnItemEquipped OnItemEquipped;

	DECLARE_DYNAMIC_MULTICAST_DELEGATE(FOnItemUnequipped);
	UPROPERTY(BlueprintAssignable) FOnItemUnequipped OnItemUnequipped;

	UPROPERTY(BlueprintReadOnly) AActor* CarriedItem;
	UPROPERTY(BlueprintReadOnly) AItem* EquippedItem;

};

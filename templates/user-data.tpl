#!/bin/bash

ECS_CONFIG_FILE="/etc/ecs/ecs.config"

echo ECS_CLUSTER=${CLUSTER_NAME} >> $ECS_CONFIG_FILE
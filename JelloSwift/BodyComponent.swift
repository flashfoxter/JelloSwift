//
//  BodyComponent.swift
//  JelloSwift
//
//  Created by Luiz Fernando Silva on 16/08/14.
//  Copyright (c) 2014 Luiz Fernando Silva. All rights reserved.
//

import CoreGraphics

// Represents a component that can be added to a body to change it's physical characteristics
public class BodyComponent
{
    // Initializes a new instance of the BodyComponent class
    public required init(body: Body)
    {
        
    }
    
    // Makes the body component prepare itself after it has been added to a body
    public func prepare(body: Body)
    {
        
    }
    
    // This function should add all internal forces to the Force member variable of each PointMass in the body.
    // These should be forces that try to maintain the shape of the body.
    public func accumulateInternalForces(body: Body)
    {
        
    }
    
    // This function should add all external forces to the Force member variable of each PointMass in the body.
    // These are external forces acting on the PointMasses, such as gravity, etc.
    public func accumulateExternalForces(body: Body)
    {
        
    }
}

// Used to create body components into the body
public class BodyComponentCreator
{
    public var bodyComponentClass: BodyComponent.Type = BodyComponent.self
    
    public func attachToBody(body: Body)
    {
        body.addComponentType(bodyComponentClass)
        
        prepareBodyAfterComponent(body)
    }
    
    public func prepareBodyAfterComponent(body: Body)
    {
        
    }
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpa.sessions;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import jpa.entities.Carrito;

/**
 *
 * @author Usuario
 */
@Stateless
public class CarritoFacade extends AbstractFacade<Carrito> {

    @PersistenceContext(unitName = "sistem_carrito_compras_v1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CarritoFacade() {
        super(Carrito.class);
    }
    
}

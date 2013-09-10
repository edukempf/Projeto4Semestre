package DAO;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

public class GenericDao<T>{

    @PersistenceContext(unitName = "PU")
    private static EntityManager em=Persistence.createEntityManagerFactory("PU").createEntityManager();
    private Class classe;

    public EntityManager getEntityManager() {
        return em;
    }
    
    public GenericDao(Class classe){
        this.classe=classe;
    }

    public void insert(T entity) {
        em.getTransaction().begin();
        em.persist(entity);
        em.flush();
        em.getTransaction().commit();
    }

    public void edit(T entity) {
        em.getTransaction().begin();
        em.merge(entity);
        em.flush();
        em.getTransaction().commit();
    }
    
    public T get(Long id){
        return (T) em.find(classe, id);
    }

    public void remove(Long id) {
        T entity=get(id);
        if(entity==null){
            return;
        }
        em.getTransaction().begin();
        em.remove(entity);
        em.getTransaction().commit();
    }
    
    public List<T> list(){
        return em.createQuery("FROM "+classe.getSimpleName()).getResultList();
    }
    
    public List<T> listParamInteiro(Long parametro){
        Query q= em.createQuery("FROM "+classe.getSimpleName()+ " WHERE tipo.id = :id");
        q.setParameter("id", parametro);
        return q.getResultList();
    }
    public List<T> listSalasBloco(Long parametro){
        Query q= em.createQuery("FROM "+classe.getSimpleName()+ " WHERE blocoPertencente.id = :id");
        q.setParameter("id", parametro);
        return q.getResultList();
    }

}

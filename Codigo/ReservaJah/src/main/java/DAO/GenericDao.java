package DAO;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

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
        getEntityManager().getTransaction().begin();
        getEntityManager().persist(entity);
        getEntityManager().flush();
        getEntityManager().getTransaction().commit();
    }

    public void edit(T entity) {
        getEntityManager().getTransaction().begin();
        getEntityManager().merge(entity);
        getEntityManager().flush();
        getEntityManager().getTransaction().commit();
    }
    
    public T get(int id){
        return (T) getEntityManager().find(classe, id);
    }

    public void remove(int id) {
        T entity=get(id);
        if(entity==null){
            return;
        }
        getEntityManager().getTransaction().begin();
        getEntityManager().remove(entity);
        getEntityManager().getTransaction().commit();
    }
    
    public List<T> list(){
        return getEntityManager().createQuery("SELECT e FROM "+classe.getSimpleName()+" e").getResultList();
    }

}

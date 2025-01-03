package com.example.usermanagement.dao;

import com.example.usermanagement.config.HibernateUtil;
import com.example.usermanagement.model.Room;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class RoomDAO {
    public void saveRoom(Room room) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(room);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public void updateRoom(Room room) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(room);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public void deleteRoom(int id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Room room = session.get(Room.class, id);
            if (room != null) {
                session.delete(room);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public List<Room> getAllRooms() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Room", Room.class).list();
        }
    }

    public Room getRoomById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Room.class, id);
        }
    }

    public List<Room> getAvailableRooms() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Room where available = true", Room.class).list();
        }
    }
}


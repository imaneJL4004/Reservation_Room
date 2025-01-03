package com.example.usermanagement.dao;

import com.example.usermanagement.config.HibernateUtil;
import com.example.usermanagement.model.Reservation;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {
    public void saveReservation(Reservation reservation) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(reservation);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public void updateReservation(Reservation reservation) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(reservation);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public void deleteReservation(int id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Reservation reservation = session.get(Reservation.class, id);
            if (reservation != null) {
                session.delete(reservation);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public List<Reservation> getAllReservations() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Reservation", Reservation.class).list();
        }
    }
    public List<Reservation> getReservationsByUser(int userId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "from Reservation r where r.user.id = :userId";
            return session.createQuery(hql, Reservation.class)
                    .setParameter("userId", userId)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }


    public Reservation getReservationById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Reservation.class, id);
        }
    }
}


package com.dh.Wesped.Service;

import com.dh.Wesped.Model.Booking;
import com.dh.Wesped.Repository.BookingRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookingService {

    private static final Logger logger = Logger.getLogger(BookingService.class);
    private BookingRepository bookingRepository;

    @Autowired
    public BookingService(BookingRepository bookingRepository) {
        this.bookingRepository = bookingRepository;
    }

    public Booking newBooking(Booking booking) {
        logger.debug("Guardando nueva reserva: " + booking);
        return bookingRepository.save(booking);
    }

    public List<Booking> getAllBookings() {
        logger.debug("Listando reservas: ");
        return bookingRepository.findAll();
    }

    public List<Booking> filterByProductId(Integer id) {
        logger.debug("Buscando reservas con producto id: " + id);
        return bookingRepository.findByProductId(id);
    }
}
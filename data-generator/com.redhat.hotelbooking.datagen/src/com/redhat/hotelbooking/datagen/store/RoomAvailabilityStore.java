/*
 * JBoss, Home of Professional Open Source.
 * See the COPYRIGHT.txt file distributed with this work for information
 * regarding copyright ownership.  Some portions may be licensed
 * to Red Hat, Inc. under one or more contributor license agreements.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 */
package com.redhat.hotelbooking.datagen.store;

import java.util.List;

import com.redhat.hotelbooking.datagen.domain.RoomAvailability;

public final class RoomAvailabilityStore implements DomainStore {

    public enum Column {

        AVAILABLE,
        ID,
        RELEVANT_DATE,
        ROOM_ID

    }

    public static final String TABLE_NAME = "ROOM_AVAILABILITY";
    public static final String ROOM_FK_NAME = "ROOM_FK";

    // @formatter:off

    private static final String COLUMNS = "\"" + Column.ID + "\", "
                                          + '"' + Column.ROOM_ID + "\", "
                                          + '"' + Column.RELEVANT_DATE + "\", "
                                          + '"' + Column.AVAILABLE + '\"';

    private static final String CREATE_TABLE_STMT = "CREATE TABLE \"" + TABLE_NAME + "\" (\n"
                                                    + "\t\"" + Column.ID + "\" INTEGER NOT NULL,\n"
                                                    + "\t\"" + Column.ROOM_ID + "\" INTEGER NOT NULL,\n"
                                                    + "\t\"" + Column.RELEVANT_DATE + "\" DATE NOT NULL,\n"
                                                    + "\t\"" + Column.AVAILABLE + "\" BOOLEAN NOT NULL,\n"
                                                    + "\tPRIMARY KEY ( \"" + Column.ID + "\" ),\n"
                                                    + "\t" + DomainStore.createForeignKeyConstraint( ROOM_FK_NAME,
                                                                                                     Column.ROOM_ID.toString(),
                                                                                                     RoomStore.TABLE_NAME,
                                                                                                     RoomStore.Column.ID.toString() ) + "\n"
                                                    + ");";

    private static final String INSERT_STMT = "INSERT INTO \""
                                              + TABLE_NAME
                                              + "\" ( "
                                              + COLUMNS
                                              + " ) "
                                              + DomainStore.createValuesStatement( Column.values().length );

    // @formatter:on

    public RoomAvailabilityStore() {
        // nothing to do
    }

    public String getCreateTableStatement() {
        return CREATE_TABLE_STMT;
    }

    public String getDropStatement() {
        return getDropStatement( TABLE_NAME );
    }

    public String getInsertStatements( final List< RoomAvailability > roomAvailabilities ) {
        final StringBuilder ddl = new StringBuilder();
        ddl.append( "\n--" ).append( TABLE_NAME ).append( "\n\n" );

        for ( final RoomAvailability roomAvailability : roomAvailabilities ) {
            // @formatter:off
            final String insertStmt = String.format( INSERT_STMT,
                                                     toDdl( roomAvailability.getId() ),
                                                     toDdl( roomAvailability.getRoomId() ),
                                                     toDdl( roomAvailability.getDate() ),
                                                     toDdl( roomAvailability.isAvailable() ) );
            // @formatter:on
            ddl.append( insertStmt ).append( '\n' );
        }

        return ddl.toString();
    }

}
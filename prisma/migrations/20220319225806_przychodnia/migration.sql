-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Appointment" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "time" TEXT NOT NULL,
    "doctorID" TEXT NOT NULL,
    "reserverd" BOOLEAN NOT NULL DEFAULT false,
    CONSTRAINT "Appointment_doctorID_fkey" FOREIGN KEY ("doctorID") REFERENCES "Doctor" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Appointment" ("doctorID", "id", "reserverd", "time") SELECT "doctorID", "id", "reserverd", "time" FROM "Appointment";
DROP TABLE "Appointment";
ALTER TABLE "new_Appointment" RENAME TO "Appointment";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
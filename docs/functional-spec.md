# Functional Specification (summary)

> Written from the source code in `spring-boot/` and the project brief (`docs/requirements.pdf`). The team's own full specification is in `docs/project-report.docx`.

## Client and requirements
Hong Kong Homeless Care (HKHC) collects public donations online. The brief has four functions:
1. Collect donor data (personal or organisational): registration via `/new`, stored in table `edonor`.
2. Donor chooses a program and amount: `/Donation` form, saved by `/saveDonation`.
3. HKHC views donations by selection criteria (e.g. amount > $5,000): admin page `/admin` and `/view-donations`.
4. Donor receives an acknowledgement: `/Success` page (`EmailService` is there for email confirmation).

## Business rules (as implemented)
- Donation programs: Homeless Children Program, Elderly Support Program, Community Development Program.
- Amount is a whole number of HKD, at least 1 and at most 2,000,000,000.
- Donor email is unique (`unique_email` key).
- The account with email `admin` is treated as the administrator.
- Admin filters: min/max amount (swapped if entered the wrong way round), program (or all), donor email contains text. Results are sorted by amount (highest first), with the count and total shown.

## Database design (database `speed`, see `spring-boot/sql/schema.sql`)
| Table | Columns |
|---|---|
| edonor | id (PK, auto), email (unique), password, edonorname |
| donation | donation_id (PK, auto), donation_name, email, donation_program, donation_amount (int) |

## Workflow
Home -> Register (`/new`) or Login (`/login`) -> Donor home (`/userhome`) -> Donate (`/Donation`) -> Success / acknowledgement (`/Success`) -> Donation history (`/user-history`) -> Logout.
Admin: Login -> `/admin` (all donations + filter form) -> `/view-donations?minAmount=&maxAmount=&program=&email=` -> delete a donation; `/edonordb` to manage donor accounts.

## Test cases
| # | Steps | Expected |
|---|---|---|
| 1 | Register with a new email | Donor saved, appears in `/edonordb` |
| 2 | Register again with the same email | Rejected (unique email) |
| 3 | Login with a wrong password | "Your Username or Password is incorrect" |
| 4 | Donate HKD 1,000 to Homeless Children Program | Success page shows name, program, amount |
| 5 | Donate amount 0 | Blocked by form (min 1) |
| 6 | Admin filter min 5000 | Only donations >= 5000 listed |
| 7 | Admin filter program = Elderly Support Program | Only that program listed, total updated |
| 8 | Admin filter email contains "gmail" | Only matching donors listed |
| 9 | Admin delete a donation | Row removed from the list |
| 10 | Logout then open `/userhome` | Login cookie cleared |